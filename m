From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH 2/2] Add a default config for PAZ00
Date: Sun, 6 Mar 2011 16:41:30 -0800
Message-ID: <AANLkTimQTgto7q0CMCVFNsUorAZ7T-gZ==KSAW0c8XGs@mail.gmail.com>
References: <1299421906-7366-1-git-send-email-marvin24@gmx.de>
	<1299421906-7366-3-git-send-email-marvin24@gmx.de>
	<AANLkTikvb+=ht=C+8Ze9TFT8L+WD+0C-SdkevgH3Ws3G@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <AANLkTikvb+=ht=C+8Ze9TFT8L+WD+0C-SdkevgH3Ws3G-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi,

On Sun, Mar 6, 2011 at 8:36 AM, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org> wrote:
> On Sun, Mar 6, 2011 at 6:31 AM, Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org> wrote=
:
>> Signed-off-by: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
>> ---
>> =A0arch/arm/configs/paz00_defconfig | 1209 +++++++++++++++++++++++++=
+++++++++++++
>> =A01 files changed, 1209 insertions(+), 0 deletions(-)
>> =A0create mode 100644 arch/arm/configs/paz00_defconfig
>>
>
> We're trying to minimize the number of defconfigs in tree to keep
> Linus happy, and all defconfigs should be minimized using "make
> savedefconfig". =A0You can enable the paz00 board in tegra_defconfig
> instead.

Yep, together with any specific drivers that it needs to run -- the
goal is to have tegra_defconfig be a superset of the configs needed to
boot on all supported boards.


-Olof
--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" =
in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
