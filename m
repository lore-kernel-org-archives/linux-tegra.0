From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH V3 1/4] clk: tegra: mark fuse clock as critical
Date: Tue, 7 Jan 2020 09:44:33 -0700
Message-ID: <0902e0c7-5d71-e7aa-ee5d-21933e1b47fe@wwwdotorg.org>
References: <20191003205033.98381-1-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20191003205033.98381-1-swarren@wwwdotorg.org>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Prashant Gaikwad <pgaikwad@nvidia.com>, Stephen Boyd <sboyd@kernel.org>, Peter De Schrijver <pdeschrijver@nvidia.com>, linux-clk@vger.kernel.org, Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

On 10/3/19 2:50 PM, Stephen Warren wrote:
> From: Stephen Warren <swarren@nvidia.com>
> 
> For a little over a year, U-Boot on Tegra124 has configured the flow
> controller to perform automatic RAM re-repair on off->on power transitions
> of the CPU rail1]. This is mandatory for correct operation of Tegra124.
> However, RAM re-repair relies on certain clocks, which the kernel must
> enable and leave running. The fuse clock is one of those clocks. Mark this
> clock as critical so that LP1 power mode (system suspend) operates
> correctly.
> 
> [1] 3cc7942a4ae5 ARM: tegra: implement RAM repair

Thierry, this series doesn't seem to be applied yet; could you please 
take a look? Thanks.
