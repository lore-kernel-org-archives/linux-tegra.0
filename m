From: Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [tegrarcm PATCH v2 2/4] Add support for update pubkey and
 rsa-pss signatures
Date: Wed, 7 Oct 2015 10:45:01 -0700
Message-ID: <20151007174501.GA13067@nvidia.com>
References: <1443819420-26562-1-git-send-email-jimmzhang@nvidia.com>
 <1443819420-26562-3-git-send-email-jimmzhang@nvidia.com>
 <20151007170821.GA29271@nvidia.com> <561552E5.9040402@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <561552E5.9040402-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Content-Disposition: inline
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Wed, Oct 07, 2015 at 11:14:13AM -0600, Stephen Warren wrote:
> On 10/07/2015 11:08 AM, Allen Martin wrote:
> >I think this needs some documentation to show the whole flow of how
> >it's expected to be used in conjunction with openssl.  We don't have a
> >man page for cbootimage now, but if I create a patch to add one can
> >you add some instructions there about the whole flow?
> 
> A README.txt would simplify the process of reading the documentation
> (i.e. plain text rather than man page) or building the SW. At least
> for people reading the docs in the source tree. I suppose if someone
> actually installs the SW rather than simply building it in place,
> then a man page is more convenient:-)

We could have a Makefile target to run nroff on the man page to
generate a text file in the src directory.  The interaction with
openssl is an issue for end users, so should be in some documentation
installed for end users (which doesn't exist right now).

-Allen
