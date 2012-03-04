From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH v2 1/6] ARM: tegra: do not hide dma declarations
Date: Sun, 4 Mar 2012 11:00:26 -0800
Message-ID: <CAOesGMg4nBjUGb_KzZk1_d2FvCmbW2kwFqh9q_9S8TQqgYO8hw@mail.gmail.com>
References: <1330721903-8571-1-git-send-email-alan@signal11.us>
	<20120304183513.GA31064@quad.lixom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120304183513.GA31064-O5ziIzlqnXUVNXGz7ipsyg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alan Ott <alan-yzvJWuRpmD1zbRFIqnYvSA@public.gmane.org>
Cc: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Lucas De Marchi <lucas.demarchi-Y3ZbgMPKUGA34EUeqzHoZw@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Sun, Mar 4, 2012 at 10:35 AM, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org> wrote:
> On Fri, Mar 02, 2012 at 03:58:23PM -0500, Alan Ott wrote:
>> From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
>>
>> The declarations are actually required for the device
>> definitions, and are still valid even if the dma controller
>> is disabled:
>>
>> arch/arm/mach-tegra/devices.c:559:12: error: 'TEGRA_DMA_REQ_SEL_I2S_1' undeclared here (not in a function)
>> arch/arm/mach-tegra/devices.c:577:12: error: 'TEGRA_DMA_REQ_SEL_I2S2_1' undeclared here (not in a function)
>>
>> Signed-off-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
>> Signed-off-by: Alan Ott <alan-yzvJWuRpmD1zbRFIqnYvSA@public.gmane.org>
>
> Thanks, applied to cleanups-and-fixes for 3.4.

Oh, a corresponding fix for this is already in mainline, so I dropped
it again (noticed due to conflicts).


-Olof
