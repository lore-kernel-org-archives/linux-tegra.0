From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v4 11/24] PM / devfreq: tegra30: Add debug messages
Date: Fri, 19 Jul 2019 04:13:57 +0300
Message-ID: <20190719041357.0a80a2dc@dimatab>
References: <20190707223303.6755-1-digetx@gmail.com>
        <CGME20190707223640epcas4p15337f40466342832b731ad6a53be946e@epcas4p1.samsung.com>
        <20190707223303.6755-12-digetx@gmail.com>
        <c883bdbe-427f-35a1-9e63-5e4953a84286@samsung.com>
        <53cd0ba5-f814-cd9b-19c5-1d42717ca58c@gmail.com>
        <922c9178-71de-46ad-eafd-805af461bedb@samsung.com>
        <f819c226-4328-c85d-5da3-932391fa6747@gmail.com>
        <f630dacc-2065-a12d-bd03-1fc6c4363e1f@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <f630dacc-2065-a12d-bd03-1fc6c4363e1f@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Jonathan Hunter <jonathanh@nvidia.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

=D0=92 Thu, 18 Jul 2019 18:07:05 +0900
Chanwoo Choi <cw00.choi@samsung.com> =D0=BF=D0=B8=D1=88=D0=B5=D1=82:

> On 19. 7. 18. =EC=98=A4=EC=A0=84 12:46, Dmitry Osipenko wrote:
> > 17.07.2019 9:45, Chanwoo Choi =D0=BF=D0=B8=D1=88=D0=B5=D1=82: =20
> >> On 19. 7. 16. =EC=98=A4=ED=9B=84 10:26, Dmitry Osipenko wrote: =20
> >>> 16.07.2019 15:23, Chanwoo Choi =D0=BF=D0=B8=D1=88=D0=B5=D1=82: =20
> >>>> Hi Dmitry,
> >>>>
> >>>> Usually, the kernel log print for all users
> >>>> such as changing the frequency, fail or success.
> >>>>
> >>>> But, if the log just show the register dump,
> >>>> it is not useful for all users. It is just used
> >>>> for only specific developer.
> >>>>
> >>>> I recommend that you better to add more exception handling
> >>>> code on many points instead of just showing the register dump. =20
> >>>
> >>> The debug messages are not users, but for developers. Yes, I
> >>> primarily made the debugging to be useful for myself and will be
> >>> happy to change the way debugging is done if there will be any
> >>> other active developer for this driver. The registers dump is
> >>> more than enough in order to understand what's going on, I don't
> >>> see any real need to change anything here for now. =20
> >>
> >> Basically, we have to develop code and add the log for anyone.
> >> As you commented, even if there are no other developer, we never
> >> guarantee this assumption forever. And also, if added debug message
> >> for only you, you can add them when testing it temporarily.
> >>
> >> If you want to add the just register dump log for you,
> >> I can't agree. Once again, I hope that anyone understand
> >> the meaning of debug message as much possible as.
> >> =20
> >=20
> > The registers dump should be good for everyone because it's a
> > self-explanatory information for anyone who is familiar with the
> > hardware. I don't think there is a need for anything else than what
> > is proposed in this patch, at least for now. I also simply don't
> > see any other better way to debug the state of this particular
> > hardware, again this logging is for the driver developers and not
> > for users.
> >=20
> > Initially, I was temporarily adding the debug messages. Now they are
> > pretty much mandatory for verifying that driver is working
> > properly. And of course the debugging messages got into the shape
> > of this patch after several iterations of refinements. So again, I
> > suppose that this should be good enough for everyone who is
> > familiar with the hardware. And of course I'm open to the
> > constructive suggestions, the debugging aid is not an ABI and could
> > be changed/improved at any time.
> >=20
> > You're suggesting to break down the debugging into several smaller
> > pieces, but I'm finding that as not a constructive suggestion
> > because the information about the full hardware state is actually
> > necessary for the productive debugging.
> >=20
> >  =20
>=20
> Sorry for that as I saie, I cannot agree this patch. In my case,
> I don't understand what is meaning of register dump of this patch.
> I knew that just register dump are useful for real developer.

It's not only a registers dump, as you may see there is also a dump of
other properties like boosting value, OPPs selection and etc.

It looks to me that you're also missing important detail that debug
messages are compiled out unless DEBUG is defined for the drivers
build. So in order to get the debug message a user shall explicitly add
#define DEBUG macro to the code or enable debug messages globally in
the kernel's config. There is also an option for dynamic debug messages
in the kernel, but it doesn't matter now because all these messages are
turned into tracepoints later in the patch #17.

> If you want to show the register dump, you better to add some feature
> with debugfs for devfreq framework in order to read the register dump.
> As I knew, sound framework (alsa) has the similar feature for checking
> the register dump.
>=20

The intent was to have an option for dynamic debugging of the driver and
initially debug messages were good enough, but then it became not enough
and hence the debug messages were turned into tracepoints in the patch
#17. Would it be acceptable to squash this patch and #17?
