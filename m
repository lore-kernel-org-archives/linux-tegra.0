From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 2/6] ASoC: Allow the DAPM routes to be stored in	device
 tree
Date: Mon, 12 Dec 2011 12:08:24 -0700
Message-ID: <4EE65128.2090209@nvidia.com>
References: <1323291510-22338-1-git-send-email-swarren@nvidia.com> <1323291510-22338-2-git-send-email-swarren@nvidia.com> <20111208043149.GA31372@opensource.wolfsonmicro.com> <74CDBE0F657A3D45AFBB94109FB122FF17518605B1@HQMAIL01.nvidia.com> <20111210124921.GA20568@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20111210124921.GA20568-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org" <alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 12/10/2011 05:49 AM, Mark Brown wrote:
> On Fri, Dec 09, 2011 at 01:52:00PM -0800, Stephen Warren wrote:
> 
>> I'd originally made this property specific to the Tegra+WM8903 machine
>> driver, and you'd asked me to make it generic. Is there room to use
>> the binding above for the Tegra+WM8903 machine driver only, in order
>> to get the driver converted to DT, then define/implement something
>> completely generic to replace it, i.e. the stuff below?
> 
> I was asking for the code to be generic, not the binding itself.  If the 
> code could for example take a property name as an argument that'd allow 
> other bindings to use the same code without having to have a generic 
> binding which has bits which depend strongly on some Linux specific
> machine driver.

Ah right, I misunderstood then.

So, does the following sound reasonable:

Add:

snd_soc_of_parse_card_name(struct snd_soc_card *card,
			   const char *prop);

.. and have the machine driver call that whenever it decides, rather
than having e.g. snd_soc_register_card() call it.

Add:

int snd_soc_of_parse_audio_routing(struct snd_soc_card *card,
				   const char *prop);

.. and have the machine driver call that whenever it decides, rather
than having e.g. snd_soc_register_card() call it.

Remove
Documentation/devicetree/bindings/sound/embedded-audio-complex.txt from
the patches completely, and document the properties solely in the
Tegra+WM8903 machine driver binding; we can write
embedded-audio-complex.txt if we create a truly generic ASoC driver binding.

Does that sound reasonable?

Thanks.

-- 
nvpublic
