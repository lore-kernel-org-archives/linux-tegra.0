From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH tegra-cbootimage] Add automake option subdir-objects to
 prevent warnings
Date: Thu, 01 Aug 2013 14:17:54 -0600
Message-ID: <51FAC272.8040105@wwwdotorg.org>
References: <ba99c86b9074ac9053f665350e6b4985@agner.ch> <20130723154918.GB2864@dhcp-172-17-186-34.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130723154918.GB2864-RcKxWJ4Cfj3FNiLNb7+IINdj8bHVeoWogfoxzgwHRXE@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 07/23/2013 09:49 AM, Thierry Reding wrote:
> On Sun, Jul 21, 2013 at 11:25:28PM +0200, Stefan Agner wrote:
>> The SoC specific code is in subdirectories which leads to
>> warnings in newer automake versions. The option subdir-objects
>> prevents those warnings.
>> 
>> Signed-off-by: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org> --- src/Makefile.am
>> | 2 ++ 1 file changed, 2 insertions(+)
>> 
>> diff --git a/src/Makefile.am b/src/Makefile.am index
>> 6fcc0d8..6fecfc7 100644 --- a/src/Makefile.am +++
>> b/src/Makefile.am @@ -1,3 +1,5 @@ +AUTOMAKE_OPTIONS =
>> subdir-objects + AM_CFLAGS = -Wall -std=c99
>> 
>> bin_PROGRAMS = cbootimage bct_dump
> 
> Hi Stefan,
> 
> Thanks for the patch. Generally this looks good to me, though
> automake now complains:
> 
> src/Makefile.am:36: compiling `t114/parse_t114.c' in subdir
> requires `AM_PROG_CC_C_O' in `configure.ac'
> 
> Which can quite easily be solved by adding that line in
> configure.ac. Immediately following the AC_PROG_CC looks like a
> good place for it.

Stefan, are you planning on revising the patch based on Thierry's
suggestion?
