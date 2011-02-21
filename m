From: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v2 15/21] ARM: tegra: clock: Round rate before setting rate
Date: Sun, 20 Feb 2011 23:52:28 -0800
Message-ID: <AANLkTin3wPBZtgFp-AvEFhKG3X9Q7B=xFN9jR6fGjr+i@mail.gmail.com>
References: <1298154371-5641-1-git-send-email-ccross@android.com>
	<1298154371-5641-17-git-send-email-ccross@android.com>
	<AANLkTi=jJRhyMZXbs3Unr-U+J59rt4SxMQtT4KtCqWbe@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <AANLkTi=jJRhyMZXbs3Unr-U+J59rt4SxMQtT4KtCqWbe-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Sun, Feb 20, 2011 at 8:19 PM, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org> wrote:
> Hi,
>
> On Sat, Feb 19, 2011 at 2:26 PM, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org> wro=
te:
>
>> diff --git a/arch/arm/mach-tegra/clock.c b/arch/arm/mach-tegra/clock=
=2Ec
>> index 8d01a49..9798585 100644
>> --- a/arch/arm/mach-tegra/clock.c
>> +++ b/arch/arm/mach-tegra/clock.c
>> @@ -86,6 +86,7 @@ static unsigned long clk_predict_rate_from_parent(=
struct clk *c, struct clk *p)
>>
>> =A0 =A0 =A0 =A0if (c->mul !=3D 0 && c->div !=3D 0) {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0rate *=3D c->mul;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 rate +=3D c->div / 2; /* round up */
>
> Shouldn't this be "rate +=3D c->div - 1;"?
Yes, will fix
--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" =
in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
