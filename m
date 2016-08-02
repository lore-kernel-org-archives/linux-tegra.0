From: Jack Mitchell <ml-psbXN780rFT10XsdtD+oqA@public.gmane.org>
Subject: TX1 mainline GPU/wifi support
Date: Tue, 2 Aug 2016 13:32:31 +0100
Message-ID: <5654a683-b801-86d5-6699-d41b444c3688@embed.me.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi,

I am currently investigating the opportunity to move our TX1 boards over 
to mainline linux as we require some recent kernel features. I have 
successfully booted linux-next and have USB/ethernet working along with 
Docker and a recent systemd. I see that GPU support is somewhat 
implemented but I'm not sure how to integrate the current nvidia 
userspace with the driver. We use CUDA on our boards, and as such I 
assume we need the nvidia kernel blob to be driving the GPU, right?

As a second question, is there any roadmap for the wifi support on the 
TX1 devkit?

Please CC direct as I'm still waiting on subscription to the list.

Kind Regards,
Jack.
