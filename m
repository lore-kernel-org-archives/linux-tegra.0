From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 0/14] Sparse fixes for tegra
Date: Fri, 07 Oct 2011 10:54:08 +0200
Message-ID: <1578886.3aVd19SPzO@wuerfel>
References: <1317956064-17650-1-git-send-email-olof@lixom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1317956064-17650-1-git-send-email-olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Thursday 06 October 2011 19:54:10 Olof Johansson wrote:
> Some trivial fixes removing sparse warnings on tegra code.

Hi Olof,

That's a very nice series. I had a go at this across platforms before,
but had not finished it yet.

One thing I would recommend instead of having a type cast in IO_ADDRESS
is to change the definition of IO_{IRAM,CPU,PPSB,APB}_VIRT to be
an iomem pointer from the start, so any calculation you do based on
that automatically gets the right type.

In the long run, I would hope to be able to get rid of basically
all uses of IO_ADDRESS and IO_TO_VIRT in the tegra code and replace
that with device tree lookups, but that is clearly a separate issue.

	Arnd
