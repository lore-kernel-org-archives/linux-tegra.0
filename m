From: Jerome Brunet <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: Re: [RFC] DPCM for Tegra
Date: Wed, 06 May 2020 16:47:09 +0200
Message-ID: <1jwo5pf7de.fsf@starbuckisacylon.baylibre.com>
References: <1588250483-10014-1-git-send-email-spujar@nvidia.com> <1jzhalffhh.fsf@starbuckisacylon.baylibre.com> <fe842d81-22da-fbbe-b5e2-9872cefb9d8b@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <fe842d81-22da-fbbe-b5e2-9872cefb9d8b-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sameer Pujar <spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, perex-/Fr2/VpizcU@public.gmane.org, tiwai-IBi9RG/b67k@public.gmane.org, kuninori.morimoto.gx-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org
Cc: nicoleotsuka-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, nwartikar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, viswanathl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, sharadg-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, atalambedu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, rlokhande-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mkumard-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, dramesh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On Wed 06 May 2020 at 16:12, Sameer Pujar <spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:

>>>
>>> |     Front End PCMs     |  SoC DSP   |     Back End DAIs    |
>>>
>>>                           *************
>>> ADMAIF<0> <------------> *           * <----DAI<0>-----> I2S
>>>                           *           *
>>> ADMAIF<1> <------------> *           * <----DAI<1>-----> DMIC
>>>                           *    XBAR   *
>>> ADMAIF<2> <------------> *           * <----DAI<2>-----> DSPK
>>>                           *           *
>>> ADMAIF<N> <------------> *           * <----DAI<3>-----> SFC (Resampler)
>>>                           *           *
>>>                           *           * <----DAI<4>-----> MIXER
>>>                           *           *
>>>                           *           * <----DAI<N>-----> ...
>>>                           *************
>>>
>>>
>>> Follow up queries
>>> =================
>>> Based on the above experience I do have few follow up queries and request
>>> for your inputs on this.
>>>
>>>   a) Can I use a DAPM Mux control to activate a BE path? This in turn can
>>>      program required switch in XBAR.
>> My 2 cents:
>
>> DPCM should activate any BE which has:
>> * a valid DAPM path from the current FE
>> * a valid BE stream (ex: can handle the stream direction)
>
> Yes, this is taken care.
>>
>> AFAIK, you can use any combination of DAPM elements to model your
>> components, including the XBAR. Then, it is the job of the card driver to
>> link the DAPM widgets of the different components together and bring the
>> system to life.
>
> XBAR currently exports all routing widgets which can be used to
> interconnect multiple components and thus implements Mux widgets. Fixing
> the routing paths in driver would limit anyone to try a different
> combination as per the need, unless driver is modified.

I did not mean that you should restrict the routing ability of your SoC,
quite the opposite actually.

You should just expose it correctly

From the diagram above, each comp (ASMAIFs, BE even the XBAR) should
export AIF_IN/AIF_OUT widgets. Think of those as the interfaces of your
components.

The connections between those interfaces are fixed, the
represent what the HW is (IOW, the wires). They could possibly be
described in DT (audio-routing prop)

The XBAR should implement the N to M MUX and export all the necessary
kcontrols to act it. The routing magic happens in this component.
There is no limit to the flexibility this provides, unless you set one
;)

> Device tree (DT)
> can be one of the solutions here, but currently static paths can only be
> added AFAIK. Even if this is extended to include routes with Mux widgets,
> still it won't give the real flexibility.
> I cannot re-use a component for a
> different routing path, unless DT is modified again.

If you implement the XBAR capability in the comp, not a use case, there
is no reason to change it.

DT describes the HW, changing it to describe a use case means something
is wrong, usually.

>
> Hence a Mux widget with user space control could offer required
> flexibility.

Exactly, your XBAR comp should provide the widget(s) and related
kcontrol(s).

>>
>> If your XBAR is widgets are not provided by a component which also
>> provides a dai_link in the sound card, you'll need to add the component
>> to the auxiliary device list of the card for the widget to be available
>> in the card.
>
> I registered XBAR device as a component having a dummy DAI just to allow
> routing paths to be available

From you description, you XBAR should not have DAIs, just DAPM widgets
and kcontrols

> for the given sound card. Are you suggesting
> I can register XBAR as an auxiliary device so that all the routing paths
> are available?

Precisely.
I have been using the same method on Amlogic cards.
