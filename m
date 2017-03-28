From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH] arm64: tegra: Add CPU and PSCI nodes for NVIDIA Tegra210
 platforms
Date: Tue, 28 Mar 2017 10:23:23 -0600
Message-ID: <9069e2fd-bf7b-b1df-3d1b-071ee21642ef@wwwdotorg.org>
References: <1490701718-16571-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1490701718-16571-1-git-send-email-jonathanh@nvidia.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: devicetree@vger.kernel.org, Stephen Warren <swarren@nvidia.com>, Vagrant Cascadian <vagrant@debian.org>, Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org, Martin Michlmayr <tbm@cyrius.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

On 03/28/2017 05:48 AM, Jon Hunter wrote:
> Add the CPU and PSCI nodes for the NVIDIA Tegra210 platforms so that
> all CPUs can be enabled on boot. This assumes that the PSCI firmware
> has been loaded during the initial bootstrap on the device before the
> kernel starts (which is typically the case for these platforms). The
> PSCI firmware version is set to v0.2 which aligns with the current
> shipping version for Tegra.

This seems fine, although I'd expect PSCI to be used everywhere on 
Tegra, so putting this in tegra210.dtsi would make more sense.
