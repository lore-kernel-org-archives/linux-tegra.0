From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: 3.8 config file for CARMA card
Date: Thu, 04 Apr 2013 11:05:01 -0600
Message-ID: <515DB2BD.1040401@wwwdotorg.org>
References: <E61DA4A8-CD86-4F01-B8CF-D1D0D32F1C12@aotera.org> <20130402113618.GE18519@tbergstrom-lnx.Nvidia.com> <515CA087.6020805@wwwdotorg.org> <43865F50-3268-4A51-99F6-7D6A7C2DC681@aotera.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <43865F50-3268-4A51-99F6-7D6A7C2DC681-cggpePV8Dd8dnm+yROfE0A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Spencer Cheng <spencer-cggpePV8Dd8dnm+yROfE0A@public.gmane.org>
Cc: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 04/03/2013 09:00 PM, Spencer Cheng wrote:
> Hi Stephen,
> 
> On Apr 3, 2013, at 17:35, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote:
>> Spencer, which 3.8 kernel are you attempting to use?
>>
> 
> It was the stable 3.8 kernel at the time, perhaps 3.8.2.
> 
>> As Peter mentioned, we don't support CARMA upstream at the moment.
>> However, in theory, you should simply need to write a device tree file
>> to enable the upstream kernel to boot on CARMA.
> 
> Is there a HowTo on writing the device tree file? 

I don't think there's an explicit HowTo.

To get a general idea of DT content, I would start by simply reading the
existing Tegra device trees in the upstream kernel. It's probably best
to take a look at the Tegra-specific tree so you see the very latest
changes:

git://git.kernel.org/pub/scm/linux/kernel/git/swarren/linux-tegra.git
branch for-next
files arch/arm/boot/dts/tegra*.dts*
directory Documentation/devicetree/bindings/

As far as general DT background information, you could look at the
following links, which I cribbed from our internal wiki:

http://devicetree.org/Main_Page (many other links are on this page).

http://devicetree.org/Device_Tree_Usage (general DT structure for a board)

http://devicetree.org/MPC5200:PCI (some background info re: PCI
bindings; I have no idea how correct/applicable this is, but it should
aid understanding at least)

http://lists.ozlabs.org/listinfo/devicetree-discuss

http://elinux.org/images/1/14/Glikely--device-tree.pdf

http://elinux.org/Device_Trees

http://wiki.freebsd.org/FlattenedDeviceTree

http://www.denx.de/wiki/DULG/LinuxFDTBlob
