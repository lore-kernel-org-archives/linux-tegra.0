From: =?ISO-8859-1?Q?Terje_Bergstr=F6m?= <tbergstrom@nvidia.com>
Subject: Re: [PATCH 2/6] gpu: host1x: Fix syncpoint wait return value
Date: Tue, 11 Jun 2013 14:43:14 +0300
Message-ID: <51B70D52.9060601@nvidia.com>
References: <1368791388-31441-1-git-send-email-amerilainen@nvidia.com>
	<1368791388-31441-3-git-send-email-amerilainen@nvidia.com>
	<20130526101243.GB1652@mithrandir>	<51A30372.6080907@nvidia.com>
	<20130528103927.GB11547@mithrandir>	<86y5ay6hrn.fsf@miki.keithp.com>
	<20130611104800.GA29395@mithrandir>
	<CAKMK7uF=A9zZ3VgdwzU3gfOjXaYsCqfCUSPmkLdL98nKX94jFQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
In-Reply-To: <CAKMK7uF=A9zZ3VgdwzU3gfOjXaYsCqfCUSPmkLdL98nKX94jFQ@mail.gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: Daniel Vetter <daniel@ffwll.ch>
Cc: "X.Org development" <xorg-devel@lists.x.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Arto Merilainen <amerilainen@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

On 11.06.2013 14:00, Daniel Vetter wrote:
> We don't use the EAGAIN ioctl restarting to resubmit the batchbuffer
> which blew up the gpu (that one has been submitted already in a
> different ioctl call), but to be able to restart the ioctl after the
> reset has completed: We need to kick every thread which is potentially
> holding GEM locks and make sure that we block them (at a point where
> they don't hold any locks) until the reset handler completed. To avoid
> a validation nightmare we use the same codepaths as we use for signal
> interrupts, so ioctl restarting is a very natural fit for this.
> 
> Resubmitting victim workloads when a gpu crash happened is something
> the reset handler would do (kernel work item currently), not any
> userspace process doing an ioctl. But atm we don't resubmit victimized
> workloads.

I don't understand the end-to-end of how resubmit is supposed to work.
User space is not supposed to resubmit, but still EAGAIN is returned to
user space, and drmIoctl() in user space just calls the came ioctl
again. Sounds like drmIoctl() is completely wrong.

In Tegra, when a job blows up, we reset the involved units, and set the
pushbuffer pointer of host1x to point to the next job, and re-enable
units. There's no need for anybody to resubmit anything, as kernel
already has them.

Terje
