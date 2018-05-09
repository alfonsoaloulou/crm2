var $collectionHolder;

// setup an "add a expeience" link
var $addProspectLink = $('<a href="#" class="add_Prospect_link"> + Ajouter une Prospect</a>');
var $newLinkLi = $('<li></li>').append($addProspectLink);

jQuery(document).ready(function() {

    // Get the ul that holds the collection of prospect
    $collectionHolder = $('ul.prospects');
    // add a delete link to all of the existing tag form li elements
    $collectionHolder.find('li').each(function() {
        addTagFormDeleteLink($(this));
    });

    // add the "add a expeience" anchor and li to the prospect ul
    $collectionHolder.append($newLinkLi);

    // count the current form inputs we have (e.g. 2), use that as the new
    // index when inserting a new item (e.g. 2)
    $collectionHolder.data('index', $collectionHolder.find(':input').length);

    $('.add_Prospect_link').on('click', function(e) {
        console.log('called');
        // prevent the link from creating a "#" on the URL
        e.preventDefault();

        // add a new expeience form (see next code block)
        addProspectForm($collectionHolder, $newLinkLi);

    });

});
function addTagFormDeleteLink($tagFormLi) {
    var $removeFormA = $('<a href="#" > - Effacer Cet Prospect</a>');
    $tagFormLi.append($removeFormA);

    $removeFormA.on('click', function(e) {
        // prevent the link from creating a "#" on the URL
        e.preventDefault();

        // remove the li for the tag form
        $tagFormLi.remove();
    });
}
function addProspectForm($collectionHolder, $newLinkLi) {
    // Get the data-prototype explained earlier
    var prototype = $collectionHolder.data('prototype');

    // get the new index
    var index = $collectionHolder.data('index');

    var newForm = prototype;
    // You need this only if you didn't set 'label' => false in your prospect field in TaskType
    // Replace '__name__label__' in the prototype's HTML to
    // instead be a number based on how many items we have
    // newForm = newForm.replace(/__name__label__/g, index);

    // Replace '__name__' in the prototype's HTML to
    // instead be a number based on how many items we have
    newForm = newForm.replace(/__name__/g, index);

    // increase the index with one for the next item
    $collectionHolder.data('index', index + 1);

    // Display the form in the page in an li, before the "Add a expeience" link li
    var $newFormLi = $('<li></li>').append(newForm);
    $newLinkLi.before($newFormLi);
    addTagFormDeleteLink($newFormLi);
}


