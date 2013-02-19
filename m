From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [v3 0/6] ARM: tegra: convert device tree files to use CLK defines
Date: Tue, 19 Feb 2013 10:10:16 -0700
Message-ID: <5123B1F8.4040102@wwwdotorg.org>
References: <1360917814-27236-1-git-send-email-hdoyu@nvidia.com>
 <1361138717.29465.2@driftwood>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1361138717.29465.2@driftwood>
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
To: Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 02/17/2013 03:05 PM, Rob Landley wrote:
> On 02/15/2013 02:43:11 AM, Hiroshi Doyu wrote:
>> Hi,
>>
>> With new dtc+cpp feature, we could get rid of magic numbers in dts*
>> files. This patch replaces CLK IDs.
>>
>> We also plan to share those DT header files with kernel source
>> later[1].
> ...
>> [1]
>> http://lists.infradead.org/pipermail/linux-arm-kernel/2013-February/149804.html
>>
> 
> This really smells like documentation should be updated, probably
> booting-without-of.txt or similar. Alas, I'm not capable of writing such
> an update...

I'm not sure what documentation would be updated nor why. Can you
describe that?

This patch is (or should be) editing the device tree binding
documentation to (include by) reference the header file that is being
added in this patch. I don't believe there's any more general
documentation that is affected by this series.
