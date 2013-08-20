From: Peter De Schrijver <pdeschrijver@nvidia.com>
Subject: Re: [PATCH 4/5] clk: tegra: Set the clock parent of gr2d/gr3d to
 pll_c2
Date: Tue, 20 Aug 2013 11:47:58 +0300
Message-ID: <20130820084758.GR18810@tbergstrom-lnx.Nvidia.com>
References: <1375874709-10438-1-git-send-email-markz@nvidia.com>
 <1375874709-10438-4-git-send-email-markz@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1375874709-10438-4-git-send-email-markz@nvidia.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Mark Zhang <markz@nvidia.com>
Cc: Prashant Gaikwad <pgaikwad@nvidia.com>, Andrew Chew <AChew@nvidia.com>, "swarren@wwwdotorg.org" <swarren@wwwdotorg.org>, Paul Walmsley <pwalmsley@nvidia.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "mturquette@linaro.org" <mturquette@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Aug 07, 2013 at 01:25:08PM +0200, Mark Zhang wrote:
> pll_m will be the parent of gr2d/gr3d if we don't do this.
> And because pll_m runs at a high rate so gr2d/gr3d will be
> unstable. So change the parent of them to pll_c2.
> 
> Signed-off-by: Mark Zhang <markz@nvidia.com>

Acked-By: Peter De Schrijver <pdeschrijver@nvidia.com>
