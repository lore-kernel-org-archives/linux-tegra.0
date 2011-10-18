From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH] [3.3] ARM: tegra: emc: max rate based on emc table
Date: Tue, 18 Oct 2011 11:26:59 -0700
Message-ID: <CAOesGMgD_q=opmUDVbuq-8HYfwXJkSdF5QUSngb-Vx5SSbR7ow@mail.gmail.com>
References: <1318961694-21105-1-git-send-email-olof@lixom.net>
	<CAMbhsRSgLvvPMd69z7aa8A=9ndYuUkmhmsEzK4WFd3AsQBohzg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAMbhsRSgLvvPMd69z7aa8A=9ndYuUkmhmsEzK4WFd3AsQBohzg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Tue, Oct 18, 2011 at 11:23 AM, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org> wrot=
e:
> On Tue, Oct 18, 2011 at 11:14 AM, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org> wro=
te:
>> +
>> + =A0 =A0 =A0 c->max_rate =3D max * 2 * 1000;
> I don't think you should be modifying internal variables of the struc=
t
> clk from here.

I was contemplating adding a clk_set_max_rate(). Looks like some
platforms already have it, so I'll just go ahead and do it.

I'll move the shared bus iteration to that code as well then, obviously=
=2E

>
>> +
>> + =A0 =A0 =A0 list_for_each_entry(user, &c->shared_bus_list, u.share=
d_bus_user.node)
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 user->max_rate =3D c->max_rate;
