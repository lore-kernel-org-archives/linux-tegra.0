From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH] clocksource: put nodes passed to CLOCKSOURCE_OF_DECLARE
 callbacks centrally
Date: Wed, 02 Oct 2013 12:21:33 +0200
Message-ID: <524BF3AD.5000905@linaro.org>
References: <1380618053-11159-1-git-send-email-u.kleine-koenig@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1380618053-11159-1-git-send-email-u.kleine-koenig@pengutronix.de>
Sender: linux-arm-msm-owner@vger.kernel.org
To: =?UTF-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?= <u.kleine-koenig@pengutronix.de>
Cc: kernel@pengutronix.de, Thomas Gleixner <tglx@linutronix.de>, Stephen Warren <swarren@wwwdotorg.org>, Tony Prisk <linux@prisktech.co.nz>, linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, Bryan Huntsman <bryanh@codeaurora.org>, Daniel Walker <dwalker@fifo99.com>, David Brown <davidb@codeaurora.org>
List-Id: linux-tegra@vger.kernel.org

On 10/01/2013 11:00 AM, Uwe Kleine-K=C3=B6nig wrote:
> Instead of letting each driver call of_node_put do it centrally in th=
e
> loop that also calls the CLOCKSOURCE_OF_DECLARE callbacks. This is le=
ss
> prone to error and also moves getting and putting the references into=
 the
> same function.
>
> Consequently all respective of_node_put calls in drivers are removed.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---

Applied in my tree for 3.13.

Thanks
   -- Daniel

--=20
  <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software fo=
r ARM SoCs

=46ollow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
