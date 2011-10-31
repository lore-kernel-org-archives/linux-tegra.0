From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH 3/3] arm/dt: tegra: add dts file for paz00
Date: Mon, 31 Oct 2011 13:14:17 -0700
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF173EDAB86E@HQMAIL01.nvidia.com>
References: <cover.1320088857.git.marvin24@gmx.de>
 <855f09f77c03a9f081818a03effdbd3bf7a30c91.1320088857.git.marvin24@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <855f09f77c03a9f081818a03effdbd3bf7a30c91.1320088857.git.marvin24-Mmb7MZpHnFY@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Marc Dietrich wrote at Monday, October 31, 2011 1:59 PM:
> This adds a dts file for paz00. As a side effect, this also enables
> the embedded controller which controls the keyboard, touchpad, power,
> leds, and some other functions.
...
> +	serial@70006000 {
> +		clock-frequency = <216000000>;
> +	};
> +
> +	serial@70006040 {
> +		status = "disable";
> +	};
> +
> +	serial@70006200 {
> +		status = "disable";
> +	};
> +
> +	serial@70006300 {
> +		clock-frequency = <216000000>;
> +	};

Don't you also want to disable serial@70006400, or set a clock rate for
it?

-- 
nvpublic
