From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v1 0/2] Support built-in Mic on Tegra boards that use
 WM8903
Date: Sat, 21 Mar 2020 03:49:48 +0300
Message-ID: <2f5c1082-2ce9-dff1-4f9f-3442a2ac51fd@gmail.com>
References: <20200320205504.30466-1-digetx@gmail.com>
 <c27c2087-14cf-614d-a8c0-05072a54f24b@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <c27c2087-14cf-614d-a8c0-05072a54f24b-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jaroslav Kysela <perex-/Fr2/VpizcU@public.gmane.org>, Takashi Iwai <tiwai-IBi9RG/b67k@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

21.03.2020 01:30, Stephen Warren пишет:
> On 3/20/20 2:55 PM, Dmitry Osipenko wrote:
>> Hello,
>>
>> This small series adds audio route for built-in microphone on NVIDIA Tegra
>> boards that use WM8903 CODEC. In particular this is needed in order to unmute
>> internal microphone on Acer A500 tablet device. I'm planning to send out the
>> device tree for the A500 for 5.8, so will be nice to get the microphone
>> sorted out. Please review and apply, thanks in advance.
> 
> It's been a long time since I looked at this code, but the series looks
> plausible,
> Acked-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Thank you!

> (I wonder why machine->gpio_int_mic_en was already parse but never used!)

Perhaps there were plans to support it later on, but that never
materialized.
