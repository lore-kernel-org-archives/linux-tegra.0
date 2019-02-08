From: Thierry Reding <thierry.reding@gmail.com>
Subject: [GIT PULL 0/9] Tegra changes for v5.1-rc1
Date: Fri,  8 Feb 2019 16:09:26 +0100
Message-ID: <20190208150935.32108-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: arm@kernel.org
Cc: linux-tegra@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>, linux-arm-kernel@lists.infradead.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

Slightly unusual for this release is that I've included two branches
that traditionally don't go through ARM SoC (clk and cpufreq). However
these are added here because they were part of a larger series to add
CPU frequency scaling support on Tegra210 and because the respective
maintainers agreed that it was a good idea to take these through ARM
SoC.

The dependencies between the branches are purely runtime dependencies,
so I haven't marked them as dependencies. They can be applied in any
order. This also means that if you'd rather not pull the requests for
clk and cpufreq, just let me know and I'll send them out to the
corresponding maintainers.

Thanks,
Thierry
