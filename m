From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH 4/4] ARM: tegra: roth: add display DT node
Date: Wed, 02 Jul 2014 09:55:12 -0600
Message-ID: <53B42B60.1000600@wwwdotorg.org>
References: <1404303560-32209-1-git-send-email-acourbot@nvidia.com>
 <1404303560-32209-5-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1404303560-32209-5-git-send-email-acourbot@nvidia.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Alexandre Courbot <acourbot@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, Terje Bergstrom <tbergstrom@nvidia.com>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
List-Id: linux-tegra@vger.kernel.org

On 07/02/2014 06:19 AM, Alexandre Courbot wrote:
> DSI support has been fixed to support continuous clock behavior that the
> panel used on SHIELD requires, so finally add its device tree node since
> it is functional.

> diff --git a/arch/arm/boot/dts/tegra114-roth.dts b/arch/arm/boot/dts/tegra114-roth.dts

> +	host1x@50000000 {
> +		dsi@54300000 {

That node looks fine, but I wonder why we need to mark a bunch of
regulators as always-on? shouldn't the references to vdd-supply and
power-supply from this node be enough? If not, perhaps the tree
structure of the regulators isn't correct, or the DSI or panel bindings
don't allow enough regulators to be referenced?
