From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH V2 1/2] ARM: tegra: Add pinmux board file for Cardhu
Date: Sun, 26 Feb 2012 14:14:19 -0800
Message-ID: <CAOesGMj4BHL6A1Ej4nQpTkjAY3Z=MKfncc5H8DFwh4TTvPixnw@mail.gmail.com>
References: <1328138997-25665-1-git-send-email-swarren@nvidia.com>
	<20120226215141.GA11189@quad.lixom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120226215141.GA11189-O5ziIzlqnXUVNXGz7ipsyg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Sun, Feb 26, 2012 at 1:51 PM, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org> wrote:
> On Wed, Feb 01, 2012 at 04:29:56PM -0700, Stephen Warren wrote:
>> For now, this just sets up the pinmux and GPIOs required for the SD
>> card slot.
>>
>> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> ---
>> v2:
>> * Set PULL_UP for CMD and DATA pins on SD interface
>> * Add power GPIO for SDMMC1
>> * Add pinmux configuration for SDMMC4
>>
>> This will hopefully be replaced by the pinmux DT binding in the near
>> future, but until that happens, Tegra30 pinmux functionality needs to
>> be exposed somehow to unblock getting drivers tested on Tegra30.
>
> Thanks, applied to for-3.4/boards.

...and I'm two for two on sending the apply email before I have
checked dependencies.

This doesn't build, so I dropped it again. Probably a missing
dependency on pinctrl changes but please revisit on top of just the
tegra code and let me know.


-Olof
