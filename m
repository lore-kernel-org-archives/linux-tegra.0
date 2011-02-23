From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH 5/5] ARM: Tegra: Enable Harmony audio support
Date: Wed, 23 Feb 2011 13:21:31 -0800
Message-ID: <AANLkTikYhiaAgZLJ5APpbTVn-2_zdrU5S_7b_SFnu1d-@mail.gmail.com>
References: <1298487532-5000-1-git-send-email-swarren@nvidia.com>
	<1298487532-5000-6-git-send-email-swarren@nvidia.com>
	<AANLkTimffVNK2EmTqypQcrWHLisf3c8_dMsHwSbv-nWi@mail.gmail.com>
	<AANLkTikk6f0Nv8XZEmY4-85FtBE1re9hKqgFRNZkyPfz@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <AANLkTikk6f0Nv8XZEmY4-85FtBE1re9hKqgFRNZkyPfz-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi,

> The GPIO numbers above TEGRA_NR_GPIOS are allocated by the board, and
> this is in board-harmony.h, so I think its OK.

On second thought, it's probably even preferred, since otherwise the
dynamic allocation can mess up the static ones.

>> Does it need a hardcoded GPIO base, or can it use the dynamic one
>> (i.e. use -1 here)? I don't even see any reference to gpio_base in t=
he
>> driver...
> I assume that is in the ASoC tree. =A0The platform data in tegra
> for-next does not include a gpio_base entry.

Yeah, I only looked at the current driver in .37, my bad.


-Olof
--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" =
in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
