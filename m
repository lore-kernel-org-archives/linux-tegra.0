From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH tegra-uboot-scripts 2/2] Make folder for dtb files as
 an argument
Date: Wed, 23 Jul 2014 15:48:33 -0600
Message-ID: <53D02DB1.90401@wwwdotorg.org>
References: <b1286f43830d50fc483310e2e32c61ab2308a4e5.1406147204.git.stefan@agner.ch> <cc27525d885d60e977b2cf17ccf7e8735b9eddb7.1406147204.git.stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cc27525d885d60e977b2cf17ccf7e8735b9eddb7.1406147204.git.stefan-XLVq0VzYD2Y@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 07/23/2014 02:27 PM, Stefan Agner wrote:
> Some distribution use different folders to store the dtb files
> rather then storing them directly in /boot. This adds a new
> argument to define which folder U-Boot should search the dtb
> file.

> diff --git a/gen-uboot-script.py b/gen-uboot-script.py

> +parser.add_argument('--dtb-dir', dest='dtbdir', default='/boot',
> +    help='Search directory for dtbs on target; defaults to /boot')

I'd prefer the default to be None rather that a hard-coded path here.

That way, after the following code that already exists:

if args.type == 'net':
    f.write('dhcp\n')
    load='tftpboot'
    prefix=''
else:
    load='load ${devtype} ${devnum}:${rootpart}'
    prefix='/boot/'

... we can add something like:

if not args.dtbdir:
    args.dtbdir = prefix

... which will exactly preserve the existing behaviour in the
network-boot case.

> -f.write(load + ' ${fdt_addr_r} ' + prefix + '${_fdt}\n')
> +f.write(load + ' ${fdt_addr_r} ' + args.dtbdir + '/${_fdt}\n')
>  f.write('set _fdt\n')

As an aside, I guess I should write a gen-extlinux-conf.py too!
