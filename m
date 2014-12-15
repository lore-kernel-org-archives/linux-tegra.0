From: "Scott Duplichan" <scott-CDj6QYrFEYEdnm+yROfE0A@public.gmane.org>
Subject: RE: [cbootimage PATCH] cbootimage: Add 'b' (binary) flag when using fopen to open a binary file.
Date: Mon, 15 Dec 2014 15:16:40 -0600
Message-ID: <000b01d018ac$6c9b8f40$45d2adc0$@notabs.org>
References: <000f01d017bf$61e0cfe0$25a26fa0$@notabs.org> <548F1A1B.5020708@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <548F1A1B.5020708-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Content-Language: en-us
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: 'Stephen Warren' <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Stephen Warren [mailto:swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org] wrote:

]Sent: Monday, December 15, 2014 11:28 AM
]To: Scott Duplichan
]Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
]Subject: Re: [cbootimage PATCH] cbootimage: Add 'b' (binary) flag when using fopen to open a binary file.
]
]On 12/14/2014 09:59 AM, Scott Duplichan wrote:
]> Add 'b' (binary) flag when using fopen to open a binary file.
]> This keeps Windows from expanding \n to \r\n and interpreting
]> <ctrl>z as end of file. The change is to support a Windows
]> hosted coreboot build environment.
]
]This seems fine; I'll apply it in just a second.

Hello Stephen,

Thanks a lot for applying the patch.

]It seems worth being explicit on all fopens re: b-vs-t. To that end, 
]perhaps you could update the following too?
]
]> ./src/cbootimage.c:161:	context->config_file = fopen(argv[optind++], "r");
]> ./src/cbootimage.c:218:	context.raw_file = fopen(context.output_image_filename, "w+");
]> ./src/data_layout.c:1049:	fp = fopen(context->input_image_filename, "r");

I thought about this too. Microsoft defines a 't' flag for text mode.
So if fopen is called with flags "rt", the Microsoft libraries  will
understand it as read, text mode. But the 't' flag is not part of C99
or posix. C99 explicitly states "r" is "open text file for reading"
and "rb" as "open binary file for reading". Though the 't' flag will
probably be harmlessly ignored by non-Microsoft libraries, it is probably
best to avoid it since it is Microsoft-specific. I think the only time the
't' flag is needed is if the Microsoft function _set_fmode has been used
to change the default open mode from text to binary.

Thanks,
Scott
