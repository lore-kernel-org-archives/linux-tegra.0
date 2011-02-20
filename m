From: Mike Rapoport <mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: tegra: add TrimSlice board
Date: Sun, 20 Feb 2011 14:43:52 +0200
Message-ID: <4D610C88.7070305@compulab.co.il>
References: <cover.1297063443.git.mike@compulab.co.il>	<c61e1816027e51acfb5bda1e498225a4da37d92d.1297063443.git.mike@compulab.co.il>	<AANLkTim5-dmpF8r9uZp8iDsT6p61D0iaJZuHvRLfUL6Y@mail.gmail.com>	<4D57BBC7.4070306@compulab.co.il>	<AANLkTimU9tpeY3-5yisqOAKBeAtz684gtM2ieYb62zO-@mail.gmail.com> <4D58C91F.9030303@compulab.co.il>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4D58C91F.9030303-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 02/14/11 08:18, Mike Rapoport wrote:
> On 02/13/11 21:06, Colin Cross wrote:
>>>>
>>>> Ack, the machine type is merged so I'll put this in for-next.  Do you
>>>> want it enabled in tegra_defconfig?
>>>
>>> If 'select TEGRA_PCI' does not trouble you, I'd be glad to have the TrimSlice in
>>> tegra_defconfig :)
>>
>> My board without PCI doesn't boot if CONFIG_TEGRA_PCI is selected, so
>> I guess it should stay off for now.  Any idea why it wouldn't boot?
> 
> The PCI subsystem should be re-gated, otherwise any access to PCI hangs the
> system. Besides, on Harmony you need to enable two additional voltage supplies
> to provide PEX_CLK voltage.
> I'll send the patches that handle it, hopefully in the next few days.

I was little bit too enthusiastic about it :( To enable PCI on Harmony and
probably on Ventana one need to have I2C and TPS up and running before setting
up the PCI clocks...
I have working implementation on top of your  linux-tegra-2.6.37 branch (1), but
it's not quite ready to go upstream.

So, let's keep the TrimSlice out of common defconfig for now

[1]
http://git.kernel.org/?p=linux/kernel/git/rppt/linux-tegra.git;a=shortlog;h=refs/heads/tegra/devel

-- 
Sincerely yours,
Mike.
--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
