From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH 4/6] ARM: tegra: harmony: register sdhci devices
Date: Mon, 21 Feb 2011 20:32:10 -0800
Message-ID: <AANLkTinACsF2tF4H4EVCpr6DscNBuRV5JMxB9j4VjFyv@mail.gmail.com>
References: <1298315206-8887-1-git-send-email-olof@lixom.net>
	<1298315206-8887-5-git-send-email-olof@lixom.net>
	<AANLkTinimyZe0Z49=X1Jpuejjmr9=Ns8AJG2SscH0=kP@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <AANLkTinimyZe0Z49=X1Jpuejjmr9=Ns8AJG2SscH0=kP-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi,

On Mon, Feb 21, 2011 at 6:52 PM, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org> wrote=
:
> On Mon, Feb 21, 2011 at 11:06 AM, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org> wro=
te:
>> Add the 3 sdhci devices that are available on Harmony as
>> platform devices. Two go to slots (one 4-lane, one 8-lane),
>> and one goes to onboard wifi.
>>
>> Signed-off-by: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
>> ---
>> =A0arch/arm/mach-tegra/board-harmony.c | =A0 11 +++++++++++
>> =A01 files changed, 11 insertions(+), 0 deletions(-)
>>
>> diff --git a/arch/arm/mach-tegra/board-harmony.c b/arch/arm/mach-teg=
ra/board-harmony.c
>> index f6ad58b..8059c50 100644
>> --- a/arch/arm/mach-tegra/board-harmony.c
>> +++ b/arch/arm/mach-tegra/board-harmony.c
>> @@ -30,10 +30,14 @@
>>
>> =A0#include <mach/iomap.h>
>> =A0#include <mach/irqs.h>
>> +#include <mach/pinmux-t2.h>
> Why does this require including mach/pinmux-t2.h?

It was needed when the pcie data structures were brought over, and I
messed up when I dropped that patch, resulting in picking it up here.
My bad.

>> + =A0 =A0 =A0 tegra_sdhci_device1.dev.platform_data =3D &sdhci_pdata=
1;
>> + =A0 =A0 =A0 tegra_sdhci_device2.dev.platform_data =3D &sdhci_pdata=
2;
>> + =A0 =A0 =A0 tegra_sdhci_device4.dev.platform_data =3D &sdhci_pdata=
4;
>> +
> What happened to the definitions of sdhci_pdata1-4? =A0They were in t=
he
> previous version of this patch, but not this one.

Same as above -- I messed up when dropping the pci-e patch combined
with a conflict with one of the patches you pushed to for-next last
night. I must have compiled the wrong version before I posted the
series.


-Olof
--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" =
in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
