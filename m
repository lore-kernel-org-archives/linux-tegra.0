From: Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>
Subject: Re: Only 1 CPU on Jetson TX1
Date: Sat, 25 Mar 2017 10:32:51 +0200
Message-ID: <6da81dbc-b070-da0f-1589-ec2cb8f453d5@kapsi.fi>
References: <20170323001131.GA7507@jirafa.cyrius.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170323001131.GA7507-IRMp5PtgtdoigzW5ZibpNwC/G2K4zDHf@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Martin Michlmayr <tbm-R+vWnYXSFMfQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Vagrant Cascadian <vagrant-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

It appears you need to have

   fdt_copy_node_names=/cpus:/psci
   fdt_copy_src_addr=0x83080000

in your U-Boot configuration. This is documented somewhere in the middle 
of http://elinux.org/Jetson/TX1_Upstream_Kernel.

On 03/23/2017 02:11 AM, Martin Michlmayr wrote:
> Vagrant Cascadian observed that only 1 CPU is activated on the Jetson
> TX1 development kit.
>
> I can confirm this with mainline Linux and u-boot from mainline (2016.11)
> or L4T (2016.03-00633-g3ef9cdb from R23.2).
>
> I see the following in dmesg:
>
> [    0.000000] /cpus/cpu@1: missing enable-method property
> [    0.000000] /cpus/cpu@2: missing enable-method property
> [    0.000000] /cpus/cpu@3: missing enable-method property
>
> [    0.052643] Tegra Revision: A02 SKU: 23 CPU Process: 0 SoC Process: -22
> [    0.053149] EFI services will not be available.
> [    0.053316] Brought up 1 CPUs
> [    0.053325] SMP: Total of 1 processors activated.
> [    0.053341] CPU: All CPU(s) started at EL2
>
