From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH 0/3] Tegra i2c board changes + defconfig update
Date: Mon, 7 Mar 2011 15:13:49 -0800
Message-ID: <AANLkTikjoRVjbLhf_QbLu41ZKM+=q+nMxbAk81AU=O5y@mail.gmail.com>
References: <1299486399-21761-1-git-send-email-olof@lixom.net>
	<AANLkTikxNgsE37t86VkLamzzt9W-E7jBTOTfXkqEvK9p@mail.gmail.com>
	<20110307200452.GM1829@sirena.org.uk>
	<AANLkTimWi2z30tBK_1N_6gjqgbugCeCwc1oV3zWtModj@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <AANLkTimWi2z30tBK_1N_6gjqgbugCeCwc1oV3zWtModj-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Mon, Mar 7, 2011 at 12:07 PM, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org> wrote=
:
> On Mon, Mar 7, 2011 at 12:04 PM, Mark Brown
> <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org> wrote:
>> On Mon, Mar 07, 2011 at 11:59:02AM -0800, Colin Cross wrote:
>>
>>> linux-next. =A0There shouldn't be any conflicts with linux-next, an=
d
>>> there is no need for linux-next to build after merging some of its
>>> branches.
>>
>> -next gets built after each merge so the tree does need to merge wit=
hout
>> the trees that get merged later on.
>
> Ok, we can make sure Tegra is merged after i2c and asoc, in which cas=
e
> it should build fine.

Main drawback is that the tegra main for-next branch doesn't build on
its own then. Not a big deal, especially not this close to the merge
window, IMHO.

I'll send a new pull request picking up the recently posted patches
then. I'm actually OK with the paz00 patches going in .39 myself,
since they don't impact any of the existing code, so nothing can
regress because of them.

New pull request in a bit.

-Olof
--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" =
in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
