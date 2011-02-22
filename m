From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH 1/6] ARM: tegra: add tegra_gpio_table and tegra_gpio_config
Date: Tue, 22 Feb 2011 11:35:50 -0800
Message-ID: <AANLkTimBh2qDx71+P3QCeWJ0sKS1AzYOUohAdSW=AoeS@mail.gmail.com>
References: <1298354117-19097-1-git-send-email-olof@lixom.net>
	<1298354117-19097-2-git-send-email-olof@lixom.net>
	<AANLkTik9_t0mq07mysO2CcK4ppKAmuPAujownfeWEGL5@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <AANLkTik9_t0mq07mysO2CcK4ppKAmuPAujownfeWEGL5-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi

On Tue, Feb 22, 2011 at 11:18 AM, Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org> wr=
ote:
> Can you split the boardfile changes into their own patch? =A0Also see
> the below whitespace only change. =A0Other than that, looks good.

Ok, done (will push separately, no need to repost just with the split t=
hough).

Thanks.


>> =A0}
>> -
>> =A0postcore_initcall(tegra_gpio_init);
>
> whitespace only change

D'oh, sloppy of me. Fixed.


-Olof
--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" =
in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
