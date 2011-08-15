From: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH] i2c: tegra: Check for overflow errors with BUG_ON.
Date: Mon, 15 Aug 2011 12:52:36 -0700
Message-ID: <CAD=FV=Xd67iw=GXV9i4O5LKnJd20=BkYyfVuxPgxQ5GZRJEy4A@mail.gmail.com>
References: <1313434172-18319-1-git-send-email-dianders@chromium.org>
	<20110815191745.GA7178@legolas.emea.dhcp.ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20110815191745.GA7178-UiBtZHVXSwEVvW8u9ZQWYwjfymiNCTlR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: balbi-l0cyMroinI0@public.gmane.org
Cc: Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Vincent Palatin <vpalatin-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Jean Delvare <khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org>, Rakesh Iyer <riyer-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Lucas De Marchi <lucas.demarchi-Y3ZbgMPKUGA34EUeqzHoZw@public.gmane.org>, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Felipe,

On Mon, Aug 15, 2011 at 12:17 PM, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org> wrote:
> so due to a FIFO overflow you lock up the whole system ? Can't you e.g.
> reset the controller and reconfigure it rather than locking up the
> system ?

Certainly we could try to be more proactive and reset / retry / return
the error to the client.  However, since the only expected situation
where this BUG_ON should hit is due to a bug in this driver itself
(AKA: i2c clients shouldn't be able to do anything to cause the BUG_ON
to hit), that seems like a lot of added complexity.

Also: if there is an arbitrary software bug that causing an overflow
condition to occur, I'm not sure how stable the system will be.
Specifically, the i2c controller is used (among other things) to talk
to the PMU and adjust voltages in the system.  If we just sent it a
random command, I'd rather report the bug right away so we don't get
hard to find/reproduce failures in other parts of the system.

What do others think?

-Doug
