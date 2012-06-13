From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v2 07/10] ARM: tegra: pcie: Add device tree support
Date: Wed, 13 Jun 2012 10:20:04 -0600
Message-ID: <4FD8BDB4.5070000@wwwdotorg.org>
References: <1339427118-32263-1-git-send-email-thierry.reding@avionic-design.de>
 <1339427118-32263-8-git-send-email-thierry.reding@avionic-design.de>
 <4FD66410.7090001@wwwdotorg.org>
 <20120612062124.GE4040@avionic-0098.adnet.avionic-design.de>
 <4FD763C5.3090500@wwwdotorg.org>
 <20120612172041.GA28010@avionic-0098.adnet.avionic-design.de>
 <4FD7A36B.9090409@wwwdotorg.org>
 <20120613063422.GC31001@avionic-0098.mockup.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20120613063422.GC31001-RM9K5IK7kjIQXX3q8xo1gnVAuStQJXxyR5q1nwbD4aMs9pC9oP6+/A@public.gmane.org>
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
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Jesse Barnes <jbarnes-Y1mF5jBUw70BENJcbMCuUQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 06/13/2012 12:34 AM, Thierry Reding wrote:
> * Stephen Warren wrote:
...
>> I think you also need a property to specify the exact port
>> layout; the Tegra20 controller supports:
>> 
>> 1 x4 port 2 x2 ports (you can choose to use only 1 of these I
>> assume)
>> 
>> So just because only 1 of the ports is enabled, doesn't imply
>> it's x4; it could still be x2.
>> 
>> Tegra30 has more options.
> 
> Both the upstream and downstream drivers currently hard-code this
> to dual and 411 (I assume that means 1x4, 2x1?) configurations for
> Tegra20 and Tegra30 respectively. Unfortunately the register
> AFI_PCIE_CONFIG isn't documented on Tegra20 at all and for Tegra30
> lists only the valid configurations (see 28.4.1.5 PCIe CONFIG) but
> not the corresponding encodings.
> 
> Maybe a good name for the new property would be "num-lanes". I also
> wonder if this property would be better off in the parent node,
> which would make it easier to check for valid configurations.
> Otherwise the code would have to collect the settings of all the
> ports and check if the combination is valid. Then again, having
> num-lanes in the parent with one cell for each controller isn't
> very nice if each controller can be individually disabled.

Indeed, since the register that controls this is in the main register
set rather than the per-port register set, it does seem like a good
idea to put the property in the main node, not the per-port node.
