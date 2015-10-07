From: Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [tegrarcm PATCH v2 2/4] Add support for update pubkey and
 rsa-pss signatures
Date: Wed, 7 Oct 2015 10:08:21 -0700
Message-ID: <20151007170821.GA29271@nvidia.com>
References: <1443819420-26562-1-git-send-email-jimmzhang@nvidia.com>
 <1443819420-26562-3-git-send-email-jimmzhang@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1443819420-26562-3-git-send-email-jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Disposition: inline
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Fri, Oct 02, 2015 at 01:56:58PM -0700, Jimmy Zhang wrote:
> 
> Sample Configuration file update_bl_sig.cfg
>    RsaKeyModulusFile = pubkey.mod;
>    RsaPssSigBlFile = bl.sig;
> 
> where pubkey.mod and bl.sig are files that contain the public key
> modulus and bootloader's rsa-pss signature respectively.

I think this needs some documentation to show the whole flow of how
it's expected to be used in conjunction with openssl.  We don't have a
man page for cbootimage now, but if I create a patch to add one can
you add some instructions there about the whole flow?


-Allen
