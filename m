From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [GIT PULL 4/5] Tegra board updates for 3.3
Date: Tue, 27 Dec 2011 15:23:31 -0800
Message-ID: <CAOesGMjMKZ+8e+MtEuBftODbCuCC-2UiiR+VgUq7HEZw-Z2O6Q@mail.gmail.com>
References: <CAOesGMh7P6-=LbgUbYe1o7iO_-yALjce3H9ujXHW8hhikeTOsQ@mail.gmail.com>
	<201112272309.11498.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201112272309.11498.arnd-r2nGTMty4D4@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Dec 27, 2011 at 3:09 PM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> On Wednesday 21 December 2011, Olof Johansson wrote:
>> Please pull the below board updates for tegra for the 3.3 merge wind=
ow.
>>
>> Some of the board changes went into the soc branch due to close
>> dependencies, most of these are pinmux cleanup and prep for pinctrl
>> integration.
>>
>>
>> They are based on the for-3.3/soc branch.
>
> Ok, pulled into the next/boards branch.

Thanks!

>> The following changes since commit 6cc04a4420391c3f034afe8ea6e28d759=
12a70a3:
>>
>> =A0 arm/tegra: Compile tegra_dt_init_irq only when CONFIG_OF (2011-1=
2-19
>> 18:07:22 -0800)
>>
>> are available in the git repository at:
>> =A0 git://git.kernel.org/pub/scm/linux/kernel/git/olof/tegra.git for=
-3.3/boards
>>
>> Leon Romanovsky (1):
>> =A0 =A0 =A0 ARM: tegra: paz00: Fix board pinmux table.
>>
>> Marc Dietrich (1):
>> =A0 =A0 =A0 ARM: tegra: paz00: add support for wakeup gpio key
>>
>> Olof Johansson (1):
>> =A0 =A0 =A0 arm/tegra: remove __initdata annotation from pinmux tabl=
es
>>
>> Stephen Warren (9):
>> =A0 =A0 =A0 arm/tegra: Split Seaboard GPIO table to allow for Ventan=
a
>
> I only just noticed that you are inconsistent with the formatting of =
the
> patch subjects. We had a discussion about this a few months back and =
decided
> to standardize on "ARM: tegra:" instead of "arm/tegra".
>
> Please move to that style in future patches.

Ack, I had moved away from ARM: platform: myself, since it seemed like
everybody else was. :) I'll move back -- I had missed the discussion.



-Olof
