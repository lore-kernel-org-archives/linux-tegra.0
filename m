From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [PATCH] ARM: DT: tegra20/tegra30: Correct clock id for UARTB
Date: Fri, 8 Mar 2013 23:30:42 +0530
Message-ID: <513A274A.4030709@nvidia.com>
References: <1362751245-32432-1-git-send-email-ldewangan@nvidia.com> <513A2433.2080002@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <513A2433.2080002@wwwdotorg.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Friday 08 March 2013 11:17 PM, Stephen Warren wrote:
> On 03/08/2013 07:00 AM, Laxman Dewangan wrote:
>> UARTB clock bit in CAR register is 7. Correcting this
>> in DTS file.
> The register bit is 7, but the clock ID in the Tegra CAR DT binding is
> 96 for UART2 or 97 for VFIR. This was due to there being 1 clock bit and
> 2 separate IP block reset bits, or the other way around, so we highlight
> the issue by assigning different clock IDs. See the comment before the
> list of clock IDs in the binding document.

Aaha, I missed the Documentation part. I was looking for DT entry only 
found this.
