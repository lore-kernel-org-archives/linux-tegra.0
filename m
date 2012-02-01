From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: Add pinmux board file for Cardhu
Date: Tue, 31 Jan 2012 23:45:37 -0800
Message-ID: <CAOesGMjU5NvXy+jh0xVz_zZv4kQT2PNRevhvU4j2ruDShDQGFA@mail.gmail.com>
References: <1327511715-27350-1-git-send-email-swarren@nvidia.com>
	<20120201073926.GG7399@quad.lixom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120201073926.GG7399-O5ziIzlqnXUVNXGz7ipsyg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Tue, Jan 31, 2012 at 11:39 PM, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org> wrote:
> On Wed, Jan 25, 2012 at 10:15:15AM -0700, Stephen Warren wrote:
>> For now, this just sets up the pinmux and GPIOs required for the SD
>> card slot.
>>
>> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> Tested-by: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> ---
>> This will hopefully be replaced by the pinmux DT binding in the near
>> future, but until that happens, Tegra30 pinmux functionality needs to
>> be exposed somehow to unblock getting drivers tested on Tegra30.
>>
>> This of course depends on my recently posted patches that implement a
>> pinctrl subsystem driver for Tegra.
>>
>> (Peter said: Boot tested on Cardhu, MMC still doesn't work but that might
>> have another rootcause...)
>
> Thanks, applied.

Actually, dropped again until the pinctrl stuff lands for the obvious
reason. I'll revisit shortly.


-Olof
