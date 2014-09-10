From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 1/3] ASoC: tegra: add tegra sgtl5000 machine driver
Date: Wed, 10 Sep 2014 11:01:32 -0600
Message-ID: <541083EC.7080803@wwwdotorg.org>
References: <cover.1410276224.git.marcel@ziswiler.com>	<f90791ebb1799a4aa62dd6b527885ddadae3c058.1410276224.git.marcel@ziswiler.com> <CAOMZO5BYGwHGSeHeaQxEO=BUBGbno9P29et582SDzmwmfVioZA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAOMZO5BYGwHGSeHeaQxEO=BUBGbno9P29et582SDzmwmfVioZA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Marcel Ziswiler <marcel-mitwqZ+T+m9Wk0Htik3J/w@public.gmane.org>
Cc: "alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org" <alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, stefan-XLVq0VzYD2Y@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 09/09/2014 12:00 PM, Fabio Estevam wrote:
> On Tue, Sep 9, 2014 at 12:28 PM, Marcel Ziswiler <marcel-mitwqZ+T+m9Wk0Htik3J/w@public.gmane.org> wrote:
>> This binding and driver describe/support playback to headphones, and
>> capture from line-in and microphone.
>>
>> This driver is useful for the Toradex Apalis T30 and Colibri T30 modules.
>>
>> Signed-off-by: Marcel Ziswiler <marcel-mitwqZ+T+m9Wk0Htik3J/w@public.gmane.org>
>> ---
>>   .../bindings/sound/nvidia,tegra-audio-sgtl5000.txt |  45 +++++
>>   sound/soc/tegra/Kconfig                            |  10 +
>>   sound/soc/tegra/Makefile                           |   2 +
>>   sound/soc/tegra/tegra_sgtl5000.c                   | 216 +++++++++++++++++++++
>
> What about using the simple-audio-card binding instead of adding the
> tegra_sgtl5000 machine driver?
>
> An example of simple-audio-card used with sgtl5000 can be found here:
>
> http://www.spinics.net/lists/devicetree/msg44466.html

I don't think that will work; the Tegra audio complex requires some 
clock management that doesn't immediately seem to fit into the 
simple-audio-card concept.

I had intended to refactor and collapse all the Tegra DT audio bindings 
(and driver code) into a single instance so we didn't need to keep 
adding more and more. However, I unfortunately never got around to that 
and probably won't in the future either. Basically, the binding and code 
would end up essentially identical to any of the current Tegra drivers 
(or the union of them), with a few tweaks such as only creating e.g. a 
headphone jack if a property in DT said to, and moving the sampling 
frequency -> CODEC MCLK table out of the driver into a table in DT. I 
think with those things parameterized in DT, we could get away with a 
single "nvidia,tegra-audio-simple" binding and driver. Such a new 
binding could be based on simple-audio-card with extensions though.
