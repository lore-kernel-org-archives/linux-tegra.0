From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH 2/7] ARM: tegra: refactor pcie init
Date: Sun, 20 Feb 2011 10:06:46 -0800
Message-ID: <AANLkTinkCJJTxon=z2j8svc5Cuy+yQsvJRe05BEvyjA=@mail.gmail.com>
References: <1298180684-6261-1-git-send-email-olof@lixom.net>
	<1298180684-6261-3-git-send-email-olof@lixom.net>
	<4D610B63.1080407@compulab.co.il>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4D610B63.1080407-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Rapoport <mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi,

On Sun, Feb 20, 2011 at 4:38 AM, Mike Rapoport <mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org> wrote:
> On 02/20/11 07:44, Olof Johansson wrote:
>> PCIe init is really quite simple. The per-board specifications can be
>> moved into the base board file instead, and pass in the pinmux groups
>> to enable/disable when setting up PCIe.
>
> This is correct only when you have a bootloader that enables all the supplies
> required for PCI to operate. On Harmony you need to enable LDO0 on the TPS
> before starting the PCI, otherwise the board will hang...

Same will probably be true for more or less every board that uses
PCI-e. I guess we'll see as we start to add more boards.

The main reason I wanted to move most of the init into pcie.c was to
remove what was likely to be duplicated code from new board files. I
have a couple of more boards that will be introduced in the
not-too-distant future and I wanted to avoid having to do a whole lot
of copy-and-edit between them. It's likely to take a while of
iterative cleanups and restructuring before we know what scales well
though.

> I have some implementation of it at [1], but it's not yet upstream ready.

Cool, I'll keep an eye on your progress since we now have some boards
with PCI-e as well, and our bootloader doesn't enable the PCI-e
supplies.


-Olof
--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
