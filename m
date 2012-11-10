From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 1/2] drm: Add NVIDIA Tegra20 support
Date: Fri, 09 Nov 2012 17:09:51 -0700
Message-ID: <509D9B4F.6060003@wwwdotorg.org>
References: <1352469579-3337-1-git-send-email-thierry.reding@avionic-design.de>
 <1352469579-3337-2-git-send-email-thierry.reding@avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1352469579-3337-2-git-send-email-thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Dave Airlie <airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 11/09/2012 06:59 AM, Thierry Reding wrote:
> This commit adds a KMS driver for the Tegra20 SoC. This includes basic
> support for host1x and the two display controllers found on the Tegra20
> SoC. Each display controller can drive a separate RGB/LVDS output.

I applied these two patches and the two arch/arm/mach-tegra patches you
posted, directly on top of next-20121109, and I see the following build
failure:

> drivers/gpu/drm/tegra/output.c: In function 'tegra_output_init':
> drivers/gpu/drm/tegra/output.c:166:9: error: 'struct tegra_output' has no member named 'display'
> drivers/gpu/drm/tegra/output.c:166:3: error: implicit declaration of function 'of_get_display'
> drivers/gpu/drm/tegra/output.c:167:20: error: 'struct tegra_output' has no member named 'display'
> drivers/gpu/drm/tegra/output.c:168:25: error: 'struct tegra_output' has no member named 'display'
> drivers/gpu/drm/tegra/output.c:179:13: error: 'struct tegra_output' has no member named 'display'
> drivers/gpu/drm/tegra/output.c:180:3: error: implicit declaration of function 'display_put'
> drivers/gpu/drm/tegra/output.c:180:21: error: 'struct tegra_output' has no member named 'display'
> drivers/gpu/drm/tegra/output.c:257:20: error: 'struct tegra_output' has no member named 'display'
> drivers/gpu/drm/tegra/output.c: In function 'tegra_output_exit':
> drivers/gpu/drm/tegra/output.c:272:20: error: 'struct tegra_output' has no member named 'display'

Does this depend on something not in linux-next?
