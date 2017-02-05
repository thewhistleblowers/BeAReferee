$(document).ready(function()
{
    // Nascondo l'icona al caricamento della pagina
    $("#back_to_top").hide();

    // Intercetto lo scroll di pagina
    $(window).scroll(function()
    {

       // Se l'evento scroll si verifica, mostro l'icona con effetto dissolvenza
        $("#back_to_top").fadeIn(500);

       // Se si verifica il ritorno ad inizio pagina, nascondo l'icona con effetto dissolvenza
        if ($("body").scrollTop() == 0)
        {
            $("#back_to_top").fadeOut(500);
        }
    });

    // Al click sull'icona, torno ad inizio pagina con movenza fluida
    $("#back_to_top").click(function()
    {
        $("html,body").animate({scrollTop: 0}, 500, function(){});
    });
});


