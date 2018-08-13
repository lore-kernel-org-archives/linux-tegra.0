From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH 01/14] staging: media: tegra-vde: Support BSEV clock and
 reset
Date: Mon, 13 Aug 2018 18:09:46 +0300
Message-ID: <2754354.GStWHyBo4g@dimapc>
References: <20180813145027.16346-1-thierry.reding@gmail.com>
 <20180813145027.16346-2-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <20180813145027.16346-2-thierry.reding@gmail.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: devel@driverdev.osuosl.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Monday, 13 August 2018 17:50:14 MSK Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> The BSEV clock has a separate gate bit and can not be assumed to be
> always enabled. Add explicit handling for the BSEV clock and reset.
> 
> This fixes an issue on Tegra124 where the BSEV clock is not enabled
> by default and therefore accessing the BSEV registers will hang the
> CPU if the BSEV clock is not enabled and the reset not deasserted.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---

Are you sure that BSEV clock is really needed for T20/30? I've tried already 
to disable the clock explicitly and everything kept working, though I'll try 
again.

The device-tree changes should be reflected in the binding documentation.
