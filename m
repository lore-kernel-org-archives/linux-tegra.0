From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [cbootimage PATCH] cbootimage: Add 'b' (binary) flag when using
 fopen to open a binary file.
Date: Mon, 15 Dec 2014 10:27:55 -0700
Message-ID: <548F1A1B.5020708@wwwdotorg.org>
References: <000f01d017bf$61e0cfe0$25a26fa0$@notabs.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <000f01d017bf$61e0cfe0$25a26fa0$@notabs.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Scott Duplichan <scott-CDj6QYrFEYEdnm+yROfE0A@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 12/14/2014 09:59 AM, Scott Duplichan wrote:
> Add 'b' (binary) flag when using fopen to open a binary file.
> This keeps Windows from expanding \n to \r\n and interpreting
> <ctrl>z as end of file. The change is to support a Windows
> hosted coreboot build environment.

This seems fine; I'll apply it in just a second.

It seems worth being explicit on all fopens re: b-vs-t. To that end, 
perhaps you could update the following too?

> ./src/cbootimage.c:161:	context->config_file = fopen(argv[optind++], "r");
> ./src/cbootimage.c:218:	context.raw_file = fopen(context.output_image_filename, "w+");
> ./src/data_layout.c:1049:	fp = fopen(context->input_image_filename, "r");
