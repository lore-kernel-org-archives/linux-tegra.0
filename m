From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCHv4 0/5] gpu: host1x: Add runtime pm support
Date: Tue, 08 Oct 2013 10:46:13 -0600
Message-ID: <525436D5.8010707@wwwdotorg.org>
References: <1381213648-5931-1-git-send-email-amerilainen@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1381213648-5931-1-git-send-email-amerilainen@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Arto Merilainen <amerilainen@nvidia.com>, tbergstrom@nvidia.com, treding@nvidia.com
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, mkulkarni@nvidia.com
List-Id: linux-tegra@vger.kernel.org

On 10/08/2013 12:27 AM, Arto Merilainen wrote:
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

The series, briefly,
Reviewed-by: Stephen Warren <swarren@nvidia.com>
