From: =?ISO-8859-1?Q?Terje_Bergstr=F6m?= <tbergstrom@nvidia.com>
Subject: Re: [PATCH 2/6] gpu: host1x: Fix syncpoint wait return value
Date: Wed, 12 Jun 2013 13:28:30 +0300
Message-ID: <51B84D4E.30703@nvidia.com>
References: <1368791388-31441-1-git-send-email-amerilainen@nvidia.com>
	<1368791388-31441-3-git-send-email-amerilainen@nvidia.com>
	<20130526101243.GB1652@mithrandir>	<51A30372.6080907@nvidia.com>
	<20130528103927.GB11547@mithrandir>	<86y5ay6hrn.fsf@miki.keithp.com>
	<20130611104800.GA29395@mithrandir>
	<CAKMK7uF=A9zZ3VgdwzU3gfOjXaYsCqfCUSPmkLdL98nKX94jFQ@mail.gmail.com>
	<51B70D52.9060601@nvidia.com>
	<CAKMK7uGRW4uqsSaDEehTZwknZH+mNEgyKB6-4TgfgUOaTOcoLA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
In-Reply-To: <CAKMK7uGRW4uqsSaDEehTZwknZH+mNEgyKB6-4TgfgUOaTOcoLA@mail.gmail.com>
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

On 11.06.2013 15:09, Daniel Vetter wrote:
> Maybe it wasn't clear, but -EAGAIN does _not_ resubmit work. -EAGAIN
> is used to restart the ioctl if we had to kick a thread (to make sure
> it doesn't hold any locks), e.g. for a blocking wait on oustanding
> rendering. The codepaths taken work exactly as if the thread is
> interrupt with a signal.

You did make it clear that there's no resubmission, but other parts
confused me.

So this is used so that a legacy driver which does not do fine-grained
locking can interrupt all waits for completion for a wedged submit. This
way a driver-wide lock get unlocked, cleanup code acquires locks, does
the magic to unwedge GPU, and unlocks. Then user space can re-submit the
waits as it got -EAGAIN.

Fortunately the error code doesn't really matter as long as it's not
EAGAIN, so we can just use ETIMEDOUT as Thierry suggested in his follow-up.

Terje
