From: Alexandre Courbot <acourbot@nvidia.com>
Subject: Re: [PATCH 0/3] drm/gk20a: support for reclocking
Date: Fri, 11 Jul 2014 10:42:26 +0900
Message-ID: <53BF4102.6010807@nvidia.com>
References: <1404977677-22248-1-git-send-email-acourbot@nvidia.com>
 <53BE61D9.4020202@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <53BE61D9.4020202@nvidia.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Mikko Perttunen <mperttunen@nvidia.com>, Ben Skeggs <bskeggs@redhat.com>, Ken Adams <KAdams@nvidia.com>
Cc: "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "gnurou@gmail.com" <gnurou@gmail.com>
List-Id: linux-tegra@vger.kernel.org

On 07/10/2014 06:50 PM, Mikko Perttunen wrote:
> Does GK20A itself have any kind of thermal protection capabilities?
> Upstream SOCTHERM support is not yet available (though I have a driver
> in my tree), so we are thinking of disabling CPU DVFS on boards that
> don't have always-on active cooling for now. Same might be necessary for
> GPU as well.

There is a small thermal driver ( 
https://android.googlesource.com/kernel/tegra/+/b445e5296764d18861a6450f6851f25b9ca59dee/drivers/video/tegra/host/gk20a/therm_gk20a.c 
) but it doesn't seem to do much. I believe that for Tegra we rely in 
SOCTHERM instead, but maybe Ken could confirm?
