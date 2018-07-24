From: Peter Geis <pgwipeout@gmail.com>
Subject: Re: [PATCH v3 1/2] Add sw2_sw4 voltage table to cpcap regulator.
Date: Tue, 24 Jul 2018 11:52:48 -0400
Message-ID: <2ae14535-c14f-c50f-c76a-4406f67fc682@gmail.com>
References: <20180724132541.17039-1-pgwipeout@gmail.com>
 <20180724132541.17039-2-pgwipeout@gmail.com>
 <20180724143634.GD13268@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180724143634.GD13268@sirena.org.uk>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: lgirdwood@gmail.com, robh+dt@kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 07/24/2018 10:36 AM, Mark Brown wrote:
> On Tue, Jul 24, 2018 at 09:25:40AM -0400, Peter Geis wrote:
>> SW2 and SW4 use a shared table to provide voltage to the cpu core and
>> devices on Tegra hardware.
>> Added this table to the cpcap regulator driver as the first step to
>> supporting this device on Tegra.
> 
> Please submit patches using subject lines reflecting the style for the
> subsystem.  This makes it easier for people to identify relevant
> patches.  Look at what existing commits in the area you're changing are
> doing and make sure your subject lines visually resemble what they're
> doing.
> 

Copy, should I resubmit?
