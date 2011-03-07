From: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 0/3] Tegra i2c board changes + defconfig update
Date: Mon, 7 Mar 2011 12:07:08 -0800
Message-ID: <AANLkTimWi2z30tBK_1N_6gjqgbugCeCwc1oV3zWtModj@mail.gmail.com>
References: <1299486399-21761-1-git-send-email-olof@lixom.net>
	<AANLkTikxNgsE37t86VkLamzzt9W-E7jBTOTfXkqEvK9p@mail.gmail.com>
	<20110307200452.GM1829@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20110307200452.GM1829-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Mon, Mar 7, 2011 at 12:04 PM, Mark Brown
<broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org> wrote:
> On Mon, Mar 07, 2011 at 11:59:02AM -0800, Colin Cross wrote:
>
>> linux-next. =A0There shouldn't be any conflicts with linux-next, and
>> there is no need for linux-next to build after merging some of its
>> branches.
>
> -next gets built after each merge so the tree does need to merge with=
out
> the trees that get merged later on.

Ok, we can make sure Tegra is merged after i2c and asoc, in which case
it should build fine.
--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" =
in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
