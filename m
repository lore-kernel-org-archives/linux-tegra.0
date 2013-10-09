From: =?ISO-8859-1?Q?Terje_Bergstr=F6m?= <tbergstrom@nvidia.com>
Subject: Re: [PATCHv4 0/5] gpu: host1x: Add runtime pm support
Date: Wed, 9 Oct 2013 09:42:39 +0300
Message-ID: <5254FADF.7060709@nvidia.com>
References: <1381213648-5931-1-git-send-email-amerilainen@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1381213648-5931-1-git-send-email-amerilainen@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Arto Merilainen <amerilainen@nvidia.com>, Thierry Reding <treding@nvidia.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Mayuresh Kulkarni <mkulkarni@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

On 08.10.2013 09:27, Arto Merilainen wrote:
> This series adds runtime pm support for host1x, gr2d and dc. It retains the
> current behaviour if CONFIG_PM_RUNTIME is not enabled.
> 
> The gr2d clock is enabled when a new job is submitted and disabled when
> the work is done. Due to parent->child relations between host1x->gr2d, this
> scheme enables and disables host1x clock.
> 
> For dc, the clocks are enabled in .probe and disabled in .remove via runtime
> pm instead of direct clock APIs.
> 
> Mayuresh is unfortunately not available to continue with the series and hence
> I will continue working on the patches.

The series,

Acked-By: Terje Bergstrom <tbergstrom@nvidia.com>

Terje
