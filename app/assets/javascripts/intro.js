+function ($) {
    $(function(){
        jQuery("#main-menu-dd").trigger("click");
        var intro = introJs();

        intro.setOptions({
            steps: [
                {
                    element: '.nav-user',
                    intro: '<p class="h4 text-uc"><strong>1: Quick Links</strong></p><p>Review your Account Settings or review your Calendar quickly through these links</p>',
                    position: 'left'
                },
                {
                    element: '#new-notify',
                    intro: '<p class="h4 text-uc"><strong>2: Notifications</strong></p><p>Review all your new notifications here. Weather its an broadcast or an important alert. </p>',
                    position: 'bottom'
                },
                {
                    element: '#quick-checkin',
                    intro: '<p class="h4 text-uc"><strong>3: Check In & Out</strong></p><p>Quickly Check In & Out. Once checked in it will turn red, after which use it to check out </p>',
                    position: 'bottom'
                },
                {
                    element: '#quicktodoadd',
                    intro: '<p class="h4 text-uc"><strong>4: Add New Todo & Notification</strong></p><p>Quickly create new TODOs or Post New notifications from here to all your team members </p>',
                    position: 'bottom'
                },
                {
                    element: '.slim-scroll',
                    intro: '<p class="h4 text-uc"><strong>5: Left Navigation </strong></p><p>All ActiveApplicant functionality are availble in this menu, Create jobs, employees, Review applicants, employees and much more ...  </p>',
                    position: 'right'
                },

                {
                    element: '.panel.panel-default',
                    intro: '<p class="h4 text-uc"><strong>6: Quick Glance</strong></p><p>Get all your current week working hours and leave counts with this quick glance</p>',
                    position: 'bottom'
                },
                {
                    element: '#working-hours-graph',
                    intro: '<p class="h4 text-uc"><strong>7: Working Hours </strong></p><p>Review your monthyl working hours in a simple Graph. Click on any point to see details of that day </p>',
                    position: 'top'
                },
                {
                    element: '#new_todo_demo',
                    intro: '<p class="h4 text-uc"><strong>8: TODO List </strong></p><p>Your latest 5 Todos are visible here. Click on the checkbox to mark them as resolved or click on X to delete the TODO. To reivew all your todos click on All Todos Link Below </p>',
                    position: 'top'
                }
                ,
                {
                    element: '.panel.b-light',
                    intro: '<p class="h4 text-uc"><strong>9: Quick Calendar</strong></p><p>Quickly check your leaves and important events in this calendar.</p>',
                    position: 'top'
                },
                {
                    element: '#name-com',
                    intro: '<p class="h4 text-uc"><strong>10: Thats It !! </strong></p><p>Thats It, Your good to go. For more details or any support, please chat with us using chat head options through out the website, Or write to us directly at support@activeapplicant.com. *To see this Demo again go to your Account Settings,</p>',
                    position: 'bottom'
                }


            ],
            showBullets: true,
        });

        intro.start();

    });
}(jQuery);