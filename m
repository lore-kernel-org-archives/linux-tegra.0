From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1] media: staging: tegra-vde: Replace debug messages with
 trace points
Date: Wed, 25 Jul 2018 01:38:37 +0300
Message-ID: <3929419.8vW2TRoUPb@dimapc>
References: <20180707162049.20407-1-digetx@gmail.com>
 <20180724190652.2befcaf6@coco.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <20180724190652.2befcaf6@coco.lan>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc: devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>, linux-tegra@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Wednesday, 25 July 2018 01:06:52 MSK Mauro Carvalho Chehab wrote:
> Em Sat,  7 Jul 2018 19:20:49 +0300
> 
> Dmitry Osipenko <digetx@gmail.com> escreveu:
> > Trace points are much more efficient than debug messages for extensive
> > tracing and could be conveniently enabled / disabled dynamically, hence
> > let's replace debug messages with the trace points.
> 
> This patch require some work:
> 
> $ make ARCH=i386  CF=-D__CHECK_ENDIAN__ CONFIG_DEBUG_SECTION_MISMATCH=y C=1
> W=1 CHECK='compile_checks' M=drivers/staging/media
> 
> ./include/linux/slab.h:631:13: error: undefined identifier
> '__builtin_mul_overflow' ./include/linux/slab.h:631:13: warning: call with
> no type!
> fixdep: error opening file: drivers/staging/media/tegra-vde/trace.h: No such
> file or directory

  CHECK   drivers/staging/media/tegra-vde/tegra-vde.c
/bin/sh: compile_checks: command not found

Upstream kernel doesn't have "compile_checks" script and I can't find it 
anywhere else.
