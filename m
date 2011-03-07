From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH v2 1/2] Add initial support for the Toshiba AC100/Dynabook
 AZ netbook
Date: Mon, 7 Mar 2011 15:30:21 -0800
Message-ID: <AANLkTikjV2XtXo7sZ0J2VtLQG4LAiNcb8wBFuc8qu=jw@mail.gmail.com>
References: <cover.1299526691.git.marvin24@gmx.de>
	<2717b8b15dfde5e2db0eed4c9b89dd8d4fee5e68.1299526691.git.marvin24@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2717b8b15dfde5e2db0eed4c9b89dd8d4fee5e68.1299526691.git.marvin24-Mmb7MZpHnFY@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Mon, Mar 7, 2011 at 12:01 PM, Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org> wrote:
> This patch adds the config infrastructure, the pinmux and basic
> board setup code for PAZ00 (name of board inside the AC100/AZ).
>
> Signed-off-by: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>

Thanks, looks good. Picked up in boards-for-next for .39, I don't see
a reason to not merge it earlier than .40.

I sqashed the config change in with my defconfig update.


-Olof
--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
