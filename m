From: Ks Lee <kslee.adrian@gmail.com>
Subject: [PATCH] ARM: tegra: Ensure all sched_clock() implementations are
	notrace marked
Date: Thu, 21 Apr 2011 18:16:51 +0900
Message-ID: <BANLkTi=mgQhb8x41zpi93SjbDdELUdSjZA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0572783756=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Russell King <linux@arm.linux.org.uk>
Cc: linux-tegra@vger.kernel.org, Olof Johansson <olof@lixom.net>, Erik Gilling <konkers@android.com>, linux-arm-kernel@lists.infradead.org, Colin Cross <ccross@android.com>
List-Id: linux-tegra@vger.kernel.org

--===============0572783756==
Content-Type: multipart/alternative; boundary=000e0cd2e2429fbb5a04a16a336e

--000e0cd2e2429fbb5a04a16a336e
Content-Type: text/plain; charset=ISO-8859-1

ftrace requires sched_clock() to be notrace.
Ensure that all implementations are so marked.

Signed-off-by: Adrian Lee <kyungsik.lee@lge.com>
---
 arch/arm/mach-tegra/timer.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/arm/mach-tegra/timer.c b/arch/arm/mach-tegra/timer.c
index 0fcb1eb..2f827ff 100644
--- a/arch/arm/mach-tegra/timer.c
+++ b/arch/arm/mach-tegra/timer.c
@@ -98,7 +98,7 @@ static void tegra_timer_set_mode(enum clock_event_mode
mode,
  }
 }

-static cycle_t tegra_clocksource_read(struct clocksource *cs)
+static cycle_t notrace tegra_clocksource_read(struct clocksource *cs)
 {
  return timer_readl(TIMERUS_CNTR_1US);
 }
-- 
1.7.0.4

--000e0cd2e2429fbb5a04a16a336e
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div><div><br></div><div>ftrace requires sched_clock() to be notrace.</div>=
<div>Ensure that all implementations are so marked.</div><div><br></div><di=
v>Signed-off-by: Adrian Lee &lt;<a href=3D"mailto:kyungsik.lee@lge.com" tar=
get=3D"_blank">kyungsik.lee@lge.com</a>&gt;</div>

<div>---</div><div>=A0arch/arm/mach-tegra/timer.c | =A0 =A02 +-</div><div>=
=A01 files changed, 1 insertions(+), 1 deletions(-)</div><div><br></div><di=
v>diff --git a/arch/arm/mach-tegra/timer.c b/arch/arm/mach-tegra/timer.c</d=
iv><div>

index 0fcb1eb..2f827ff 100644</div><div>--- a/arch/arm/mach-tegra/timer.c</=
div><div>+++ b/arch/arm/mach-tegra/timer.c</div><div>@@ -98,7 +98,7 @@ stat=
ic void tegra_timer_set_mode(enum clock_event_mode mode,</div><div>=A0<span=
 style=3D"white-space:pre-wrap">	</span>}</div>

<div>=A0}</div><div>=A0</div><div>-static cycle_t tegra_clocksource_read(st=
ruct clocksource *cs)</div><div>+static cycle_t notrace tegra_clocksource_r=
ead(struct clocksource *cs)</div><div>=A0{</div><div>=A0<span style=3D"whit=
e-space:pre-wrap">	</span>return timer_readl(TIMERUS_CNTR_1US);</div>

<div>=A0}</div><div>--=A0</div><div>1.7.0.4</div><div><br></div></div>

--000e0cd2e2429fbb5a04a16a336e--


--===============0572783756==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============0572783756==--
