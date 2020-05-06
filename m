From: Jerome Brunet <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: Re: [RFC] DPCM for Tegra
Date: Wed, 06 May 2020 13:51:54 +0200
Message-ID: <1jzhalffhh.fsf@starbuckisacylon.baylibre.com>
References: <1588250483-10014-1-git-send-email-spujar@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1588250483-10014-1-git-send-email-spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sameer Pujar <spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, perex-/Fr2/VpizcU@public.gmane.org, tiwai-IBi9RG/b67k@public.gmane.org, kuninori.morimoto.gx-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org
Cc: nicoleotsuka-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, nwartikar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, viswanathl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, sharadg-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, atalambedu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, rlokhande-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mkumard-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, dramesh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On Thu 30 Apr 2020 at 14:41, Sameer Pujar <spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:

> At a high level Tegra Audio HW is depicted as below.
>
> |     Front End PCMs     |  SoC DSP   |     Back End DAIs    |
>
>                          *************
> ADMAIF<0> <------------> *           * <----DAI<0>-----> I2S
>                          *           *
> ADMAIF<1> <------------> *           * <----DAI<1>-----> DMIC
>                          *    XBAR   *
> ADMAIF<2> <------------> *           * <----DAI<2>-----> DSPK
>                          *           *
> ADMAIF<N> <------------> *           * <----DAI<3>-----> SFC (Resampler)
>                          *           *
>                          *           * <----DAI<4>-----> MIXER
>                          *           *
>                          *           * <----DAI<N>-----> ...
>                          *************
>

>
>
> Follow up queries
> =================
> Based on the above experience I do have few follow up queries and request
> for your inputs on this.
>
>  a) Can I use a DAPM Mux control to activate a BE path? This in turn can
>     program required switch in XBAR.

My 2 cents:
DPCM should activate any BE which has:
* a valid DAPM path from the current FE
* a valid BE stream (ex: can handle the stream direction)

AFAIK, you can use any combination of DAPM elements to model your
components, including the XBAR. Then, it is the job of the card driver to
link the DAPM widgets of the different components together and bring the
system to life.

If your XBAR is widgets are not provided by a component which also
provides a dai_link in the sound card, you'll need to add the component
to the auxiliary device list of the card for the widget to be available
in the card.

>
>     This is needed for following reasons:
>
>     - For an open platform like Jetson, we want to give maximum flexibility
>       for a user to customize their audio paths. Number of connected
>       components and order of these can vary depending on a use case.
>
>     - Allow re-use of audio components across multiple use cases.
>       For example, number of SFC instances are lesser than PCM playback or
>       capture devices.
>
>  b) I have modelled SFC and MIXER as backends. Is this allowed?
>
>     This was done to include SFC or MIXER HW components as part of the
>     sound card and use like below in one of the audio use cases.
>  
>     ADMAIF1(FE) --> SFC(BE1) --> I2S(BE2) ... OR
>     ADMAIF2(FE) --> SFC(BE1) --> I2S(BE2) ...

What your are trying to achieve here is DAI chaining. From the DAPM
perspective, it is alright. Unfortunately this kind of chaining are
not supported (not yet, at least) from the dai_link perspective, even
with DPCM.


From the DPCM perspective, I think your patch does the following:

ADMAIF1(FE) ---> SFC(BE1)
            |--> I2S(BE2)
ADMAIF2(FE) ---> SFC(BE1)
            |--> I2S(BE2)

Your DAIs are not chained, but put in parallel. Maybe all your DAI
callbacks are called in a way that is convinient enough for your
use cases, but it is not what you intended.

For the example, the rate passed to 'I2S(BE2)' in hw_params() will
be the one provided by the 'ADMAIF', not the output rate of the 'SFC'.

>
>     I used following workaround to connect multiple BE components.
>     With this I can see PCM callbacks happen for all BE DAIs along the DAPM
>     path. The obective was to connect multiple components together and (a)
>     was used to connect one component to another. Each "-->" here connects
>     two components and it is a switch in XBAR. 
>
>     ---
>       sound/soc/soc-pcm.c | 2 +-
>       1 file changed, 1 insertion(+), 1 deletion(-)
>
>       diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
>       index e256d43..ee7af55 100644
>       --- a/sound/soc/soc-pcm.c
>       +++ b/sound/soc/soc-pcm.c
>       @@ -1494,7 +1494,7 @@ int dpcm_path_get(struct snd_soc_pcm_runtime *fe,
>  
>  	  /* get number of valid DAI paths and their widgets */
>  	  paths = snd_soc_dapm_dai_get_connected_widgets(cpu_dai, stream, list,
>       -			dpcm_end_walk_at_be);
>       +			NULL);
>  
>  	dev_dbg(fe->dev, "ASoC: found %d audio %s paths\n", paths,
>  			stream ? "capture" : "playback");
>     -- 
>
>  c) Hostless mode did NOT work:
>      - Following audio path was intended to be tested:
>        I2S1 --> SFC --> I2S2
>
>      - [3] offers two options:
>          * CODEC<->CODEC: If I were to use a separate DAI link for each BE to BE
>            connection, then it will result in a similar design what we have
>            currently.
>
>          * Hostless: I did not come across references for this.
>            (Any references in this regard will be helpful)
>
>
> May be the current Tegra ASoC design is more suitable for component model as you
> had previously mentioned. I wanted to understand if above, especially (a) and (b),
> are acceptable in this regard or if there are better options to interconnect
> multiple ASoC components.
>
> Looking forward for your feedback.
>
> Thanks,
> Sameer.
>
> References
> ==========
> [0] http://patchwork.ozlabs.org/project/linux-tegra/list/?series=159664&archive=both&state=*
> [1] http://patchwork.ozlabs.org/project/linux-tegra/patch/1582180492-25297-6-git-send-email-spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org/
> [2] http://patchwork.ozlabs.org/project/linux-tegra/patch/1582180492-25297-4-git-send-email-spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org/
> [3] https://www.kernel.org/doc/html/v5.6/sound/soc/dpcm.html
