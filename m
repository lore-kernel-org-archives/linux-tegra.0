From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [cbootimage PATCH 0/3] RSA on T124 and misc fixes
Date: Wed, 11 Nov 2015 09:30:20 -0700
Message-ID: <56436D1C.3000200@wwwdotorg.org>
References: <1446739402-14238-1-git-send-email-alban.bedel@avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1446739402-14238-1-git-send-email-alban.bedel-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alban Bedel <alban.bedel-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 11/05/2015 09:03 AM, Alban Bedel wrote:
> Hi all,
>
> this small series fix a few bugs when updating small images and add support
> for the RSA fields on T124. Using these patches and an adapted version of
> the sign.sh script I was able to generate images that works properly on a
> fused SoC.

Nit: Note that essentially all Tegra SoCs are "fused" in some way. The 
question is more whether an SBK/PKC has been enabled (via fuses).
